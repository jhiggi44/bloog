import React, { useState } from 'react';

export default function TitleInput(updateTitle) {
 const [text, setText] = useState("This is a default TITLE from Hooks!")

 function handleUpdate(event) {
  setText(event.target.value)
  updateTitle(event.target.value)
 }

 return (
  <label>
   Title
   <input 
     type="text" 
     id="Title" 
     value={text} 
     onChange={handleUpdate}
   />
  </label>
 );
}