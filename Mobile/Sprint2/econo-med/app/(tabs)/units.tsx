import { StyleSheet, Text, View } from "react-native";
import MapView from "react-native-maps";
import Search from "@/assets/icons/search";
import Voice from "@/assets/icons/voice";
import { StatusBar } from "expo-status-bar";
import { COLORS } from "@/constants/colors";

export default function TabOneScreen() {
  return (
    <View style={styles.container}>
      <StatusBar translucent backgroundColor="transparent" />
      <MapView
        style={{ flex: 1, width: "100%" }}
        initialRegion={{
          latitude: -23.531608239042676,
          longitude: -46.5771278989023,
          latitudeDelta: 0.0922,
          longitudeDelta: 0.0421,
        }}
      />
      <View
        style={{
          position: "absolute",
          top: 40,
          left: 0,
          right: 0,
          borderWidth: 1,
          borderColor: COLORS.subtleLight,
          marginHorizontal: 24,
          borderRadius: 24,
          paddingVertical: 12,
          paddingHorizontal: 16,
          backgroundColor: "white",
          flexDirection: "row",
          alignItems: "center",
          gap: 10,
          elevation: 5,
        }}
      >
        <Search color={COLORS.normal} width={24} height={24} />
        <Text
          style={{
            color: COLORS.subtleDark,
            fontFamily: "WorkSans_500Medium",
            marginRight: 10,
            fontSize: 18,
            flex: 1,
          }}
        >
          Pesquise aqui
        </Text>
        <Voice color={COLORS.normal} />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: COLORS.white,
  },
});
