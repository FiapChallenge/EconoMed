import ImagePlaceholder from "@/assets/icons/imagePlaceholder";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { StyleSheet, Text, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export default function TabOneScreen() {
  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: COLORS.white }}>
      <View style={styles.container}>
        <View style={styles.placeholder}>
          <ImagePlaceholder color={COLORS.subtleLight} height={24} width={24} />
        </View>
        <View
          style={{
            alignItems: "center",
            justifyContent: "center",
          }}
        >
          <Text style={styles.title}>Oops!</Text>
          <Text style={styles.title}>Conecte-se à Internet</Text>
          <Text
            style={[
              textStyles.label_large,
              {
                color: COLORS.subtleDark,
                textAlign: "center",
                marginTop: 12,
                marginHorizontal: 20,
              },
            ]}
          >
            Você está off-line. Verifique sua conexão e tente novamente.
          </Text>
        </View>
        <View
          style={{
            padding: 12,
            backgroundColor: COLORS.primary,
            borderRadius: 10,
          }}
        >
          <Text style={[textStyles.headline_small, { color: "white" }]}>
            TENTAR NOVAMENTE
          </Text>
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    backgroundColor: COLORS.white,
    justifyContent: "center",
    marginHorizontal: 24,
    gap: 48,
  },
  title: {
    fontFamily: "WorkSans_600SemiBold",
    fontSize: 30,
  },
  placeholder: {
    width: 240,
    height: 240,
    backgroundColor: COLORS.background,
    borderRadius: 8,
    borderWidth: 2,
    borderColor: COLORS.subtleLight,
    justifyContent: "center",
    alignItems: "center",
  },
});
