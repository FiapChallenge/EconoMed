import Bell from "@/assets/icons/bell";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { Link } from "expo-router";
import { StyleSheet, Text, View } from "react-native";

export default function HomeGreetingsContainer() {
  return (
    <View style={styles.greetingContainer}>
      <View>
        <Text style={textStyles.headline_small}>Olá Augusto!</Text>
        <Text style={[textStyles.label_medium, { color: COLORS.subtleDark }]}>
          como está se sentindo hoje?
        </Text>
      </View>
      <Link
        href={"/(tabs)/notifications"}
      >
        <View
          style={{
            padding: 12,
            borderRadius: 20,
            borderWidth: 1,
            borderColor: COLORS.subtleLight,
          }}
        >
          <Bell color={COLORS.black} />
        </View>
      </Link>
    </View>
  );
}

const styles = StyleSheet.create({
  greetingContainer: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    marginTop: 24,
  },
});
