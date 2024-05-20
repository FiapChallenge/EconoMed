import ImagePlaceholder from "@/assets/icons/imagePlaceholder";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { Link } from "expo-router";
import { Text, View } from "react-native";

export default function HomeFastAcessCard(props: {
  nome: string;
  active?: boolean;
  icon?: any;
  link?: string;
}) {
  return (
    <Link href={props.link ? props.link : "/(tabs)"}>
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          gap: 16,
        }}
      >
        <View
          style={{
            padding: 12,
            width: 96,
            height: 96,
            backgroundColor: props.active ? COLORS.primary : COLORS.background,
            borderRadius: 16,
            justifyContent: "center",
            alignItems: "center",
            gap: 8,
          }}
        >
          {!props.icon && (
            <ImagePlaceholder
              color={props.active ? COLORS.white : COLORS.primary}
              height={33.25}
              width={33.25}
            />
          )}
          {props.icon && (
            <props.icon
              color={props.active ? COLORS.white : COLORS.primary}
              height={33.25}
              width={33.25}
            />
          )}
          <Text
            style={[
              textStyles.label_medium,
              { color: props.active ? COLORS.white : COLORS.black },
            ]}
          >
            {props.nome}
          </Text>
        </View>
      </View>
    </Link>
  );
}
