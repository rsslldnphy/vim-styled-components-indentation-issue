# vim-styled-components-indentation-issue

This is a minimal project reproducing a clash between the vim-jsx-pretty and vim-styled-components plugins.

To reproduce the issue, first open `index.tsx` using the config that doesn't use `vim-styled-components`.

```
nvim -u init-without-styled-components.vim index.tsx
```

Then indent the file using `gg=G`. You should see a correctly indented file like this:

```typescript

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
```

Now open `index.tsx` using the config that includes `vim-styled-components`:

```
nvim -u init-with-styled-components.vim index.tsx
```

Indent the file using `gg=G` and you should see that the indentation does not work as expected - it ends up looking like this:

```typescript
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
```

It's possible to get _close_ to a fix by reordering the plugin includes so that `vim-styled-components` is included _before_ `vim-jsx-pretty`. This leaves the tsx indentation intact, and syntax-highlights the `styled-components` template string correctly, but doesn't indent it correctly:

```
nvim -u init-with-reordered-styled-components.vim index.tsx
```

```typescript
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
```
