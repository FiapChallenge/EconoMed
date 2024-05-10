import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { ScrollView, Text, View } from "react-native";

export default function HomeSectionContainer({
  children,
  title,
  direction,
}: {
  children: React.ReactNode;
  title: string;
  direction?: "row" | "column";
}) {
  return (
    <View
      style={{
        flexDirection: "column",
        gap: 16,
      }}
    >
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          alignItems: "center",
        }}
      >
        <Text style={textStyles.title_medium}>{title}</Text>
        <Text style={[textStyles.title_small, { color: COLORS.subtleDark }]}>
          Veja tudo
        </Text>
      </View>
      <View
        style={{
          flexDirection: direction || "row",
          gap: 8,
          rowGap: 16,
        }}
      >
        <ScrollView
          horizontal={direction !== "column"}
          showsHorizontalScrollIndicator={false}
          showsVerticalScrollIndicator={false}
          contentContainerStyle={{
            columnGap: 8,
          }}
          style={{
            height: direction === "column" ? 256 : undefined,
          }}
        >
          {children}
        </ScrollView>
      </View>
    </View>
  );
}
