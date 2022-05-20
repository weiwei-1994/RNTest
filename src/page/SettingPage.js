import React,{Component}from 'react';
import {
  StyleSheet,
  Text,
  View
} from 'react-native';

export default class SettingPage extends Component {
    render() {
      return (
        <View style={styles.container}>
            <Progress.Bar progress={0.3} width={200} />
        </View>
      );
    }
  }
  
  const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: '#FFFFFF'
    },
  });