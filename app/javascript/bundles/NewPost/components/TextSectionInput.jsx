import React, { useState } from 'react';
import TextareaAutosize from 'react-autosize-textarea';

export default function TextSectionInput({position, sectionText, updateSection}) {
 const [text, setText] = useState(sectionText)

 function handleUpdate(event) {
  setText(event.target.value)
  updateSection(position, {type: "text", value: event.target.value})
 }

 return (
  <label className="text-section-label-wrapper">
   <span className="white-accent" >{`Section ${position}:`}</span>
   <fieldset>
    <TextareaAutosize 
     name={`Section ${position}`} 
     value={text} 
     onChange={handleUpdate}
     className="bg-dark-accent white"
    />
   </fieldset>
  </label>
 );
}