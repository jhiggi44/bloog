import React from 'react';

export default function AddSectionButton({addSection}) {
 function handleClick(e) {
  e.preventDefault()
  addSection({type: "text"})
 }

 return (
  <button onClick={handleClick}>
   +
  </button>
 );
}