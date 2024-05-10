import ImagePlaceholder from "@/assets/icons/imagePlaceholder";
import Star from "@/assets/icons/star";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { Image, ImageBackground, StyleSheet, Text, View } from "react-native";
import Marker from "@/assets/icons/marker";

export default function HomeLastAppointmentsCard(props: {
  nome: string;
  especialidade1: string;
  especialidade2?: string;
  nota: number;
  distancia: number;
  image?: string;
}) {
  return (
    <View style={styles.container}>
      <View style={styles.placeholder}>
        <ImageBackground
          source={{
            uri: props.image,
          }}
          style={{ width: "100%", height: "100%" }}
          imageStyle={{
            resizeMode: "cover",
            height: 140,
          }}
        />
      </View>
      <View
        style={{ flexDirection: "column", gap: 8, justifyContent: "center" }}
      >
        <View style={{ flexDirection: "column", gap: 2 }}>
          <Text style={textStyles.title_medium}>{props.nome}</Text>
          <View style={{ flexDirection: "row", gap: 4 }}>
            <Text
              style={[textStyles.label_small, { color: COLORS.subtleDark }]}
            >
              {props.especialidade1}
            </Text>
            {props.especialidade2 && (
              <>
                <Text
                  style={[textStyles.label_small, { color: COLORS.subtleDark }]}
                >
                  •
                </Text>
                <Text
                  style={[textStyles.label_small, { color: COLORS.subtleDark }]}
                >
                  {props.especialidade2}
                </Text>
              </>
            )}
          </View>
        </View>
        <View style={{ flexDirection: "row", gap: 32 }}>
          <View style={{ flexDirection: "row", gap: 2, alignItems: "center" }}>
            <Star color={COLORS.primary} height={16} width={16} />
            <Text style={textStyles.title_small}>{props.nota}</Text>
          </View>
          <View style={{ flexDirection: "row", gap: 2, alignItems: "center" }}>
            <Marker color={COLORS.primary} height={16} width={16} />
            <Text style={textStyles.title_small}>{props.distancia} m</Text>
          </View>
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    gap: 16,
    marginBottom: 16,
  },
  placeholder: {
    width: 90,
    height: 90,
    backgroundColor: COLORS.background,
    borderRadius: 16,
    borderColor: COLORS.subtleLight,
    justifyContent: "center",
    alignItems: "center",
    overflow: "hidden",
  },
});
