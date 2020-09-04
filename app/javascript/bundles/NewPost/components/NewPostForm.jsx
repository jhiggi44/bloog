import React, { useReducer } from 'react';
import TextSectionInput from "./TextSectionInput"
import TitleInput from "./TitleInput"
import AddSectionButton from "./AddSectionButton"


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

const initialState = {
  title: "Some Default",
  sections: [{type:"text"}]
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
    case 'add_section':
      state["sections"].push({ type: action.section_details.type })
      return state;
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

 function updateTitle(title) {
  dispatch({
   type: "update_title", 
   title: title
  });
 }

 function addSection(details) {
   dispatch({
     type: "add_section",
     section_details: details
   });
 }

 return (
   <form>
    <TitleInput updateTitle={updateTitle} />
    <div className="bg-dark-accent sections-wrapper">
      { 
        state.sections.map((section, i) => {
          return <TextSectionInput 
            key={i}
            position={i} 
            sectionText={section.value || "Default Text"}
            updateSection={updateSection}
          />
        }) 
      }
      <AddSectionButton addSection={addSection} />
    </div>
    <input 
     className="submit-button"
     type="submit" 
     value="Submit" 
     onClick={(e) => { handleSubmit(e, state, 1) }} />
   </form>
 );
}