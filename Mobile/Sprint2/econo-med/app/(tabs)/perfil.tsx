import ImagePlaceholder from "@/assets/icons/imagePlaceholder";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { Pressable, StyleSheet, Text, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { auth } from "@/firebaseConfig";
import { router } from "expo-router";

export default function TabOneScreen() {
  const handleLogout = async () => {
    try {
      await auth.signOut();
      router.replace("/login");
    } catch (error) {
      console.log(error);
    }
  };

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
          <Text style={styles.title}>Desculpas</Text>
          <Text style={styles.title}>Em manunteção</Text>
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
            Perdão, a página está em manutenção Tente novamente mais tarde
          </Text>
        </View>
        <Pressable
          style={{
            padding: 12,
            backgroundColor: COLORS.primary,
            borderRadius: 10,
          }}
          onPress={handleLogout}
        >
          <Text style={[textStyles.headline_small, { color: "white" }]}>
            DESLOGAR
          </Text>
        </Pressable>
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
