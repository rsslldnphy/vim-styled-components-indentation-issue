import React from 'react';
import styled from 'styled-components';

const red = 'red';

const ListItem = styled.li`
background-color: ${red};
color: #000;
`;

const Foo = () => {
  const [counter, setCounter] = React.useState(0);
  return (
    <div>
      <button onClick={e => setCounter(counter + 1)} >
	You have clicked me { counter } times.
      </button>
      <ul>
	{[1, 2, 3].map(
	  n => (
	    <ListItem>List item { n }</ListItem>
	  )
	)}
      </ul>
    </div>
  );
};
