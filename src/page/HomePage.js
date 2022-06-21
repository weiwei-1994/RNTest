import React,{Component}from 'react';
import {
  StyleSheet,
  Text,
  Button,
  Image,
  View,
  NativeModules
} from 'react-native';
import Toast, {DURATION} from 'react-native-easy-toast'
import NativeView from '../compent/NativeView'
const NativeModule = NativeModules.NativeModule;

export default class HomePage extends Component {
    render() {
      return (
        <View style={styles.container}>
        <Toast 
            ref="toast"
            position='center'
            fadeInDuration={2000}
            fadeOutDuration={1000}/>
        <Button
          title="进入插件设置页3"
          onPress={() => this.props.navigation.navigate("Setting")}
        />
        <Image source={require('../image/robot.png')}  style={styles.img}  />
        <Button  
            title="调用Native模块"
            onPress={() => NativeModule.addEvent("param1","param2",(response) =>{
                this.refs.toast.show(response);
            })}/>
        <NativeView 
            style={styles.nativeView}
            labelText = "js传入原生组件参数"
            onClick = {(event) => {
                this.refs.toast.show(event.responseKey);
            }}
        />
        </View>
      );
    }
  }
  
  const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: '#FFFFFF'
    },
    img:{
        width: 100,
        height: 100,
    },
    nativeView:{
        width:200,
        height:200,
        margin:50,
        backgroundColor:'#FF0000'
    }
  });