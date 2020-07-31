import React, { useReducer } from 'react';
import TextSectionInput from "./TextSectionInput"

const initialState = [];

function reducer(state, action) {
  switch (action.type) {
    case 'update_section':
      let new_state = [...state]
      new_state[action.section_position] = action.section_details
      return new_state;
    default:
      throw new Error();
  }
}

function handleSubmit(event, post, user_id) {
 event.preventDefault();

 const token = 
      document.querySelector('[name=csrf-token]').content

 fetch(`http://localhost:8080/users/${user_id}/posts`, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-CSRF-TOKEN': token
  },
  body: JSON.stringify({ user_id: user_id, post: post }),
 })
 .then(response => response.json())
 .then(data => {
   console.log('Success:', data);
 })
 .catch((error) => {
   console.error('Error:', error);
 });
}

export default function NewPost() {
 const [state, dispatch] = useReducer(reducer, initialState);

 function updateSection(position, details) {
  dispatch({
   type: "update_section", 
   section_position: position, 
   section_details: details 
  });
 }

 return (
  <main>
   <h1>New Post</h1>
   <form>
    <label htmlFor="title">Title</label>
    <input type="text" id="Title" defaultValue="Some Awesome Title" /><br/>
    <TextSectionInput position={0} updateSection={updateSection} />
    <TextSectionInput position={1} updateSection={updateSection} />
    <input 
     type="submit" 
     defaultValue="Submit" 
     onClick={(e) => { handleSubmit(e, state, 1) }} />
   </form>
  </main>
 );
}