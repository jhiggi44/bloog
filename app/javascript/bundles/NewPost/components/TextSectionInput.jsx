import React, { useState } from 'react';

export default function TextSectionInput({position, updateSection}) {
 const [text, setText] = useState("This is a default from Hooks!")

 function handleUpdate(event) {
  setText(event.target.value)
  updateSection(position, {type: "text", value: event.target.value})
 }

 return (
  <fieldset>
   <textarea 
    name="basic_text" 
    cols="30" 
    rows="10" 
    value={text} 
    onChange={handleUpdate}
   />
  </fieldset>
 );
}