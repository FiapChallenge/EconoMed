import ImagePlaceholder from "@/assets/icons/imagePlaceholder";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";
import Checkbox from "expo-checkbox";
import { Link, router, useLocalSearchParams } from "expo-router";
import { createUserWithEmailAndPassword, getAuth } from "firebase/auth";
import { useEffect, useState } from "react";
import { Pressable, StyleSheet, Text, TextInput, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

export default function Register() {
  const [cep, setCep] = useState("");
  const [logradouro, setLogradouro] = useState("");
  const [numero, setNumero] = useState("");
  const [cidade, setCidade] = useState("");
  const [estado, setEstado] = useState("");
  const [cpf, setCpf] = useState("");

  const [checked, setChecked] = useState(false);

  useEffect(() => {
    if (cep.length === 9) {
      fetch(`https://viacep.com.br/ws/${cep}/json/`)
        .then((response) => response.json())
        .then((data) => {
          setLogradouro(data.logradouro);
          setCidade(data.localidade);
          setEstado(data.uf);
        })
        .catch((error) => {
          console.error(error);
        });
    }
  }, [cep]);

  const formatCEP = (cep: string) => {
    return cep.replace(/\D/g, "").replace(/(\d{5})(\d{3})/, "$1-$2");
  };

  const formatCPF = (cpf: string) => {
    return cpf
      .replace(/\D/g, "")
      .replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, "$1.$2.$3-$4");
  };

  const handleNext = async () => {
    if (!cep || !logradouro || !numero || !cidade || !estado || !cpf) {
      alert("Preencha todos os campos");
      return;
    }
    if (!checked) {
      alert("Você deve concordar com os termos");
      return;
    }
    try {
      router.push({
        pathname: "/register2",
        params: {
          cep: cep,
          logradouro: logradouro,
          numero: numero,
          cidade: cidade,
          estado: estado,
          cpf: cpf,
        },
      });
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.container}>
        <View style={styles.placeholder}>
          <ImagePlaceholder color={COLORS.subtleDark} width={24} height={24} />
        </View>

        <View style={{ gap: 16 }}>
          <View style={{ gap: 8 }}>
            <Text style={textStyles.label_medium}>CEP</Text>
            <TextInput
              selectionColor={COLORS.primary}
              value={cep}
              onChangeText={(text) => setCep(formatCEP(text))}
              style={styles.input}
              keyboardType="numeric"
            />
          </View>
          <View style={{ gap: 8, flexDirection: "row" }}>
            <View style={{ gap: 8 }}>
              <Text style={textStyles.label_medium}>Logradouro</Text>
              <TextInput
                selectionColor={COLORS.primary}
                value={logradouro}
                onChangeText={setLogradouro}
                style={[
                  styles.input,
                  {
                    width: 240,
                  },
                ]}
              />
            </View>
            <View style={{ gap: 8 }}>
              <Text style={textStyles.label_medium}>Nº</Text>
              <TextInput
                selectionColor={COLORS.primary}
                value={numero}
                onChangeText={setNumero}
                style={[
                  styles.input,
                  {
                    width: 72,
                  },
                ]}
                keyboardType="numeric"
              />
            </View>
          </View>
          <View style={{ gap: 8, flexDirection: "row" }}>
            <View style={{ gap: 8 }}>
              <Text style={textStyles.label_medium}>Cidade</Text>
              <TextInput
                selectionColor={COLORS.primary}
                value={cidade}
                onChangeText={setCidade}
                style={[
                  styles.input,
                  {
                    width: 208,
                  },
                ]}
              />
            </View>
            <View style={{ gap: 8 }}>
              <Text style={textStyles.label_medium}>Estado</Text>
              <TextInput
                selectionColor={COLORS.primary}
                value={estado}
                onChangeText={setEstado}
                style={[
                  styles.input,
                  {
                    width: 104,
                  },
                ]}
              />
            </View>
          </View>
          <View style={{ gap: 8 }}>
            <Text style={textStyles.label_medium}>CPF</Text>
            <TextInput
              selectionColor={COLORS.primary}
              value={cpf}
              onChangeText={(text) => setCpf(formatCPF(text))}
              style={styles.input}
              keyboardType="numeric"
            />
          </View>
        </View>
        <View
          style={{
            gap: 16,
            marginTop: -8,
            flexDirection: "row",
            maxWidth: 320,
            alignItems: "center",
          }}
        >
          <Checkbox
            value={checked}
            onValueChange={setChecked}
            color={COLORS.primary}
          />
          <Text
            style={[
              textStyles.label_small,
              {
                color: COLORS.subtleDark,
                fontSize: 13,
                lineHeight: 20,
                flex: 1,
              },
            ]}
          >
            Concordo com os{" "}
            <Text style={{ color: COLORS.primary }}>Termos de Uso</Text> e{" "}
            <Text style={{ color: COLORS.primary }}>
              Política de Privacidade
            </Text>
          </Text>
        </View>
        <Pressable onPress={handleNext}>
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
              Registrar
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
    gap: 32,
    marginHorizontal: 32,
    marginTop: 8,
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
