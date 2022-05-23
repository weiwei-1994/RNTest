import React from 'react'
import {
    Button,
    NativeModules
 } from 'react-native';
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import HomePage from "../page/HomePage"
import SettingPage from "../page/SettingPage"
import SchedulePage from "../page/SchedulePage"

const Stack = createNativeStackNavigator();
const NativeModule = NativeModules.NativeModule;

function APP(){
    return(
        <NavigationContainer>
            <Stack.Navigator>
                <Stack.Screen 
                name="Home" 
                component={HomePage}
                options={{
                    headerTitle:"插件首页",
                    headerLeft:(props)=>{return (
                    <Button  
                        title="返回App"
                        onPress={() => NativeModule.nativeStackPop()}/>)}
                }}
                />
                <Stack.Screen 
                name="Setting" 
                component={SettingPage}
                options={{
                    headerTitle:"插件设置页"
                }}/>
                <Stack.Screen
                name='Schedule'
                component={SchedulePage}
                options={{
                    headerTitle:"插件定时列表页"
                }}
                />
            </Stack.Navigator>
        </NavigationContainer>
    );
}
export default APP