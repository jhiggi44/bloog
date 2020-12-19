import React, { useState } from 'react';

export default function TitleInput(updateTitle) {
 const [text, setText] = useState("A title")

 function handleUpdate(event) {
  setText(event.target.value)
  updateTitle(event.target.value)
 }

 return (
  <label className="flex-label-wrapper-for-text-input bg-dark-accent white-accent">
   <span >Title:</span>
   <input 
     size="1"
     type="text" 
     id="Title" 
     value={text} 
     onChange={handleUpdate}
     className="bg-dark-accent white"
   />
  </label>
 );
}