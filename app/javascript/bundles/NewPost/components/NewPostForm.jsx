import React, { useReducer } from 'react';
import TextSectionInput from "./TextSectionInput"
import TitleInput from "./TitleInput"

const initialState = {
  title: "Some Default",
  sections: []
};

function reducer(stateToUpdate, action) {
  let state = {...stateToUpdate}
  switch (action.type) {
    case 'update_title':
      state["title"] = action.title
      return state;
    case 'update_section':
      state["sections"][action.section_position] = action.section_details
      return state;
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
  body: JSON.stringify({ post: post }),
 })
 .then(response => {
   console.log(response.status)
   if (response.status === 200) {
    window.location.replace(response.url);
   }
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

 function updateTitle(title) {
  dispatch({
   type: "update_title", 
   title: title,
  });
 }

 return (
   <form>
    <TitleInput updateTitle={updateTitle} />
    <br/>
    <TextSectionInput position={0} updateSection={updateSection} />
    <TextSectionInput position={1} updateSection={updateSection} />
    <input 
     type="submit" 
     defaultValue="Submit" 
     onClick={(e) => { handleSubmit(e, state, 1) }} />
   </form>
 );
}