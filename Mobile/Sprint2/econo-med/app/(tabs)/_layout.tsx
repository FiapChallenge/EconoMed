import React from "react";
import FontAwesome from "@expo/vector-icons/FontAwesome";
import { Tabs } from "expo-router";
import { Text } from "react-native";
import Search from "@/assets/icons/search";
import Home from "@/assets/icons/home";
import Bell from "@/assets/icons/bell";
import User from "@/assets/icons/user";
import { COLORS } from "@/constants/colors";
import { textStyles } from "@/constants/text";

function TabBarIcon(props: {
  name: React.ComponentProps<typeof FontAwesome>["name"];
  color: string;
  label?: string;
}) {
  return (
    <>
      {(() => {
        switch (props.name) {
          case "home":
            return <Home color={props.color} />;
          case "search":
            return <Search color={props.color} width={24} height={24} />;
          case "bell":
            return <Bell color={props.color} />;
          case "user":
            return <User color={props.color} width={24} height={24} />;
        }
      })()}
      <Text
        style={[
          textStyles.label_small,
          {
            color: props.color,
            marginTop: 5,
          },
        ]}
      >
        {props.label}
      </Text>
    </>
  );
}

export default function TabLayout() {
  return (
    <Tabs
      screenOptions={{
        tabBarActiveTintColor: COLORS.primary,
        tabBarInactiveTintColor: COLORS.subtleDark,
        headerShown: false,
        tabBarStyle: {
          borderTopWidth: 2,
          borderColor: COLORS.background,
          alignSelf: "center",
          flexDirection: "row",
          height: 80,
        },
        tabBarItemStyle: {
          width: "auto",
        },
      }}
    >
      <Tabs.Screen
        name="index"
        options={{
          tabBarLabel: () => null,
          tabBarIcon: ({ color }) => (
            <TabBarIcon name="home" color={color} label="Home" />
          ),
        }}
      />
      <Tabs.Screen
        name="units"
        options={{
          tabBarLabel: () => null,
          tabBarIcon: ({ color }) => (
            <TabBarIcon name="search" color={color} label="Unidades" />
          ),
        }}
      />
      <Tabs.Screen
        name="notifications"
        options={{
          tabBarLabel: () => null,
          tabBarIcon: ({ color }) => (
            <>
              <TabBarIcon name="bell" color={color} label="Notificações" />
            </>
          ),
        }}
      />
      <Tabs.Screen
        name="perfil"
        options={{
          tabBarLabel: () => null,
          tabBarIcon: ({ color }) => (
            <TabBarIcon name="user" color={color} label="Perfil" />
          ),
        }}
      />
    </Tabs>
  );
}
