import { requireNativeComponent } from 'react-native';
import PropTypes from 'prop-types'
import React from 'react';

const RNNativeView = requireNativeComponent('RNNativeView', NativeView);

class NativeView extends React.Component{
    
    _onClick = (event) =>{
        if (!this.props.onClick) {
            return;
        }
    
        // process raw event...
        this.props.onClick(event.nativeEvent);
    }

    render() {
        return <RNNativeView 
        {...this.props} 
        onClick = {this._onClick}
        />;
      }
}

NativeView.propTypes = {
    /**
     label文本框文案
     */
     labelText: PropTypes.string,
    /** 
     * 点击按钮回调
    */
     onClick: PropTypes.func
  };

export default NativeView;
