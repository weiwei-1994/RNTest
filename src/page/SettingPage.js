import React,{Component}from 'react';
import {
  StyleSheet,
  SafeAreaView,
  FlatList,
  Text,
  View,
  TouchableOpacity,
  NativeModules
} from 'react-native';
const NativeModule = NativeModules.NativeModule;
const DATA = [
  {
    id: 'Name',
    title: 'Name',
  },
  {
    id: 'Schedule',
    title: 'Schedule',
  }
];

export default class SettingPage extends Component {
  _item = (item) => {
    return (
      <TouchableOpacity onPress={() => this._selectItem(item)}>
        <View style={styles.item}>
          <Text style={styles.title}>{item.title}</Text>
        </View>
      </TouchableOpacity>
    );
  }

  _separatorComponent = () => {
    return <View style={{marginLeft: 10, marginRight: 10, height: 1, backgroundColor: '#F0F4F7'}}/>
  }

  _selectItem = (item) => {
    if(item.title == "Name"){
      NativeModule.nativeRouter("deivceName");
    }else if(item.title == "Schedule"){
      this.props.navigation.navigate("Schedule");
    }
  }

    render() {
      return (
        <SafeAreaView style={styles.container}>
          <FlatList
            data={DATA}
            renderItem={({item}) => this._item(item)}
            keyExtractor={item => item.id}
            ItemSeparatorComponent ={this._separatorComponent}
            />
        </SafeAreaView>
      );
    }
  }
  
  const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: '#FFFFFF'
    },
    item: {
      padding: 20,
      marginVertical: 8,
      marginHorizontal: 16,
    },
    title: {
      fontSize: 16,
    },
  });