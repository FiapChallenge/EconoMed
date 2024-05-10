import ImagePlaceholder from "@/assets/icons/imagePlaceholder";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { Link } from "expo-router";
import { StyleSheet, Text, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export default function HomeScreen() {
  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <View style={styles.placeholder}>
          <ImagePlaceholder color={COLORS.subtleDark} width={24} height={24} />
        </View>
        <View style={{ alignItems: "center", gap: 12 }}>
          <Text
            style={[
              textStyles.headline_large,
              { color: COLORS.normal, textAlign: "center" },
            ]}
          >
            Bem-vindo ao Econo
            <Text style={{ color: COLORS.primary }}>Med</Text>
          </Text>
          <Text style={[textStyles.body_large, { color: COLORS.normal }]}>
            Seu Sistema de Saúde Inteligente
          </Text>
        </View>
        <View style={{ alignItems: "center", gap: 24 }}>
          <Link href={"/register"}>
            <View
              style={{
                backgroundColor: COLORS.primary,
                paddingVertical: 16,
                borderRadius: 16,
                width: 320,
              }}
            >
              <Text
                style={[
                  textStyles.label_large,
                  { color: COLORS.white, textAlign: "center" },
                ]}
              >
                REGISTRE-SE
              </Text>
            </View>
          </Link>
          <Link href={"/login"}>
            <View
              style={{
                backgroundColor: COLORS.white,
                borderWidth: 1,
                borderColor: COLORS.primary,
                paddingVertical: 16,
                borderRadius: 16,
                width: 320,
              }}
            >
              <Text
                style={[
                  textStyles.label_large,
                  { color: COLORS.black, textAlign: "center" },
                ]}
              >
                LOGIN
              </Text>
            </View>
          </Link>
        </View>
        <Text
          style={[
            textStyles.label_small,
            { color: COLORS.subtleDark, textAlign: "center" },
          ]}
        >
          Ao criar sua conta, você concorda com nossos{" "}
          <Text style={{ color: COLORS.primary }}>Termos de Uso</Text> e{" "}
          <Text style={{ color: COLORS.primary }}>Política de Privacidade</Text>
        </Text>
      </View>
      <View style={styles.backgroundContainer}>
        <ImagePlaceholder color={COLORS.subtleDark} width={24} height={24} />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    gap: 40,
    marginHorizontal: 32,
    marginTop: 80,
  },
  placeholder: {
    width: 304,
    height: 144,
    backgroundColor: COLORS.background,
    borderRadius: 16,
    borderWidth: 2,
    borderColor: COLORS.subtleLight,
    justifyContent: "center",
    alignItems: "center",
  },
  backgroundContainer: {
    position: "absolute",
    bottom: 0,
    width: "100%",
    height: 168,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: COLORS.background,
  },
});
