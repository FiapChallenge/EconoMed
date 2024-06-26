import React from "react";
import { G, Path, Svg } from "react-native-svg";

function Marker(props: { color: string; width: number; height: number }) {
  return (
    <Svg width={props.width} height={props.height} viewBox="0 0 24 24">
      <G
        id="Iconly/Light-Outline/Location"
        stroke="none"
        stroke-width="1"
        fill="none"
        fill-rule="evenodd"
      >
        <G
          id="Location"
          transform="translate(4.000000, 1.000000)"
          fill={props.color}
        >
          <Path
            d="M8.2495,1 C12.7985,1 16.4995,4.729 16.4995,9.313 C16.4995,14.948 10.0435,20.5 8.2495,20.5 C6.4555,20.5 -0.0005,14.948 -0.0005,9.313 C-0.0005,4.729 3.7005,1 8.2495,1 Z M8.2495,2.5 C4.5275,2.5 1.4995,5.557 1.4995,9.313 C1.4995,14.092 7.1235,18.748 8.2495,18.996 C9.3755,18.747 14.9995,14.091 14.9995,9.313 C14.9995,5.557 11.9715,2.5 8.2495,2.5 Z M8.2505,6 C10.0425,6 11.5005,7.458 11.5005,9.251 C11.5005,11.043 10.0425,12.5 8.2505,12.5 C6.4585,12.5 5.0005,11.043 5.0005,9.251 C5.0005,7.458 6.4585,6 8.2505,6 Z M8.2505,7.5 C7.2855,7.5 6.5005,8.285 6.5005,9.251 C6.5005,10.216 7.2855,11 8.2505,11 C9.2155,11 10.0005,10.216 10.0005,9.251 C10.0005,8.285 9.2155,7.5 8.2505,7.5 Z"
            id="Combined-Shape"
          ></Path>
        </G>
      </G>
    </Svg>
  );
}

export default Marker;
