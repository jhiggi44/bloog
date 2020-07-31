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
    <input type="submit" defaultValue="Submit" onClick={(e) => { e.preventDefault(); console.log(state); }} />
   </form>
  </main>
 );
}