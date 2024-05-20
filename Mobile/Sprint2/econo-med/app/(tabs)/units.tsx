import { Dimensions, StyleSheet, Text, TextInput, View } from "react-native";
import MapView from "react-native-maps";
import Search from "@/assets/icons/search";
import Voice from "@/assets/icons/voice";
import { StatusBar } from "expo-status-bar";
import { COLORS } from "@/constants/colors";
import { useState } from "react";

const { width, height } = Dimensions.get("window");
const ASPECT_RATIO = width / height;
const INITIAL_LATITUDE = -23.531608239042676;
const INITIAL_LONGITUDE = -46.5771278989023;
const LATITUDE_DELTA = 0.0922;
const LONGITUDE_DELTA = LATITUDE_DELTA * ASPECT_RATIO;
const INITIAL_REGION = {
  latitude: INITIAL_LATITUDE,
  longitude: INITIAL_LONGITUDE,
  latitudeDelta: LATITUDE_DELTA,
  longitudeDelta: LONGITUDE_DELTA,
};

export default function TabOneScreen() {
  const [search, setSearch] = useState("");

  const searchPlaces = async () => {
    if (!search.trim().length) return;

    const googleApisUrl =
      "https://maps.googleapis.com/maps/api/place/textsearch/json";
    const input = search.trim();
    const location = `${INITIAL_LATITUDE},${INITIAL_LONGITUDE}`;
    const radius = 2000;
    // Need to add the API key to the .env file
    const url = `${googleApisUrl}?input=${input}&inputtype=textquery&location=${location}&radius=${radius}&key=${process.env.GOOGLE_API_KEY}`;
    try {
      const response = await fetch(url);
      const data = await response.json();
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <View style={styles.container}>
      <StatusBar translucent backgroundColor="transparent" />
      <MapView
        style={{ flex: 1, width: "100%" }}
        initialRegion={INITIAL_REGION}
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
        <TextInput
          value={search}
          onChangeText={setSearch}
          placeholder="Pesquise aqui"
          placeholderTextColor={COLORS.subtleDark}
          onSubmitEditing={searchPlaces}
          style={{
            color: COLORS.normal,
            fontFamily: "WorkSans_500Medium",
            marginRight: 10,
            fontSize: 18,
            flex: 1,
          }}
        ></TextInput>
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
