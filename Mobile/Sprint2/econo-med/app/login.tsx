import HideEye from "@/assets/icons/hide_eye";
import ImagePlaceholder from "@/assets/icons/imagePlaceholder";
import ShowEye from "@/assets/icons/show_eye";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { useEffect, useState } from "react";
import { Pressable, StyleSheet, Text, TextInput, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { app } from "@/firebaseConfig";
import { getAuth, signInWithEmailAndPassword } from "firebase/auth";
import { router } from "expo-router";

export default function login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [user, setUser] = useState(null);
  const [isLogin, setIsLogin] = useState(false);
  const [showPassword, setShowPassword] = useState(false);

  function handleShowPassword() {
    setShowPassword(!showPassword);
  }

  const auth = getAuth(app);

  const handleAuth = async (auth: any, email: string, password: string) => {
    if (!email || !password) {
      alert("Preencha todos os campos");
      return;
    }
    try {
      setEmail(email.trim());
      const user = await signInWithEmailAndPassword(auth, email, password);
      setIsLogin(true);
      if (user) {
        console.log(user);
      }
      router.replace("/(tabs)");
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <View style={styles.placeholder}>
          <ImagePlaceholder color={COLORS.subtleDark} width={24} height={24} />
        </View>
        <Text
          style={{
            fontFamily: "WorkSans_600SemiBold",
            color: COLORS.normal,
            fontSize: 40,
            lineHeight: 48,
          }}
        >
          Login
        </Text>
        <View style={{ gap: 24 }}>
          <View style={{ gap: 8 }}>
            <Text style={textStyles.label_medium}>Email</Text>
            <TextInput
              selectionColor={COLORS.primary}
              value={email}
              onChangeText={setEmail}
              style={styles.input}
            />
          </View>
          <View style={{ gap: 8 }}>
            <Text style={textStyles.label_medium}>Senha</Text>
            <View>
              <TextInput
                selectionColor={COLORS.primary}
                value={password}
                onChangeText={setPassword}
                style={styles.input}
                secureTextEntry={!showPassword}
              />
              <Pressable
                style={{ position: "absolute", right: 16, top: 12 }}
                onPress={handleShowPassword}
              >
                {showPassword ? (
                  <HideEye color={COLORS.subtleDark} />
                ) : (
                  <ShowEye color={COLORS.subtleDark} />
                )}
              </Pressable>
            </View>
            <Text style={[textStyles.label_small, { color: "#7C7D81" }]}>
              Esqueceu a senha?
            </Text>
          </View>
        </View>
        <Pressable onPress={() => handleAuth(auth, email, password)}>
          <View
            style={{
              width: 320,
              height: 48,
              borderRadius: 8,
              backgroundColor: COLORS.primary,
              justifyContent: "center",
              alignItems: "center",
            }}
          >
            <Text style={[textStyles.label_large, { color: COLORS.white }]}>
              Entrar
            </Text>
          </View>
        </Pressable>
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
    marginTop: 24,
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
  input: {
    width: 320,
    height: 48,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: COLORS.subtleLight,
    paddingHorizontal: 16,
    paddingVertical: 12,
  },
});
