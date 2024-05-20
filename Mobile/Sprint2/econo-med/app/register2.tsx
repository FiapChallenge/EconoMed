import HideEye from "@/assets/icons/hide_eye";
import ImagePlaceholder from "@/assets/icons/imagePlaceholder";
import ShowEye from "@/assets/icons/show_eye";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import { Link, router, useLocalSearchParams } from "expo-router";
import { useState } from "react";
import { Pressable, StyleSheet, Text, TextInput, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import {
  getAuth,
  fetchSignInMethodsForEmail,
  createUserWithEmailAndPassword,
} from "firebase/auth";

export default function Register2() {
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  const params = useLocalSearchParams();

  const { cep, logradouro, numero, cidade, estado, cpf } = params;

  function handleShowPassword() {
    setShowPassword(!showPassword);
  }

  const auth = getAuth();

  const handleRegister = async () => {
    if (!nome || !email || !password) {
      alert("Preencha todos os campos");
      return;
    }
    const emailRegex = /\S+@\S+\.\S+/;
    if (!emailRegex.test(email)) {
      alert("Email inválido");
      return;
    }
    if (password.length < 6) {
      alert("A senha deve ter no mínimo 6 caracteres");
      return;
    }
    try {
      await createUserWithEmailAndPassword(
        auth,
        email as string,
        password as string
      );
      router.replace({
        pathname: "/(tabs)",
      });
    } catch (error: any) {
      if (error.code === "auth/email-already-in-use") {
        alert("Email já cadastrado");
        return;
      }
      console.error(error);
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
          Registre-se
        </Text>
        <View style={{ gap: 24 }}>
          <View style={{ gap: 8 }}>
            <Text style={textStyles.label_medium}>Nome</Text>
            <TextInput
              selectionColor={COLORS.primary}
              value={nome}
              onChangeText={setNome}
              style={styles.input}
            />
          </View>
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
          </View>
        </View>
        <Pressable onPress={handleRegister}>
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
              Próximo
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
    height: 176,
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
