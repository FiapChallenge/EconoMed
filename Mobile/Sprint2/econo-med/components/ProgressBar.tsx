import { COLORS } from "@/constants/colors";
import { Bar } from "react-native-progress";

export default function ProgressBar(props: { progress: number }) {
  return (
    <Bar
      progress={props.progress}
      color={COLORS.primary}
      unfilledColor={COLORS.background}
      borderWidth={0}
      height={8}
      width={280}
    />
  );
}
