import React from "react";
import { G, Path, Svg } from "react-native-svg";

function Search(props: { color: string; width: number; height: number }) {
  return (
    <Svg width={props.width} height={props.height} viewBox="0 0 24 24">
      <G fill="none" fillRule="evenodd" stroke="none" strokeWidth="1">
        <G fill={props.color} transform="translate(2 2)">
          <Path d="M9.739 0c5.37 0 9.738 4.368 9.738 9.738a9.703 9.703 0 01-2.564 6.578l3.131 3.125a.749.749 0 11-1.06 1.062l-3.168-3.16a9.69 9.69 0 01-6.077 2.134c-5.37 0-9.74-4.369-9.74-9.739C0 4.368 4.37 0 9.74 0zm0 1.5c-4.543 0-8.24 3.695-8.24 8.238 0 4.543 3.697 8.239 8.24 8.239 4.542 0 8.238-3.696 8.238-8.239 0-4.543-3.696-8.238-8.238-8.238z"></Path>
        </G>
      </G>
    </Svg>
  );
}

export default Search;
