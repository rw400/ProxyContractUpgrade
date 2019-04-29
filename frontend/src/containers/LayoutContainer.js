import React, {Component} from 'react'
import Button from '../components/Button'
import {connect} from 'react-redux'
import {incrementCount, decrementCount} from '../actions/index'

class LayoutContainer extends Component{

    // constructor(props) {
    //     super(props);

    //     this.state = {
    //         transactions: [
    //             '0x43982tgrw98g39r8ge742044455',
    //             '0x43hg3h3oig3g390gu3jgij30965',
    //             '0x65kuy5uj5jh5yhjh5yj5ykly665'
    //         ],
    //         migrations: [
    //             '1_initial_migration',
    //             '2_Storage_migration',
    //             '3_Final_migration'
    //         ]
    //     }
    // } 
    
    handleBtnActionIncrement = () => {
        this.props.onIncrementClick(this.props.count)
    }

    handleBtnActionDecrement = () => {
        this.props.onDecrementClick(this.props.count)
    }

    render() {
        // const migrations = this.state.migrations.map((item, id) => {
        //   return <li key={id}><button>[+]</button>{item}</li>
        // });        
        
        const {hash, idNum, count}=this.props;
        return(
            <div>
              <h1>Transaction Hash: {hash}</h1>
              <h1>MigrationID: {idNum}</h1>
              <h3>Nonce: {count}</h3>
              <Button action={this.handleBtnActionIncrement} buttonTitle = "Next" />
              <Button action={this.handleBtnActionDecrement} buttonTitle = "Back" />

            </div>
        );
    }
}

const mapStateToProps = (state) => {
  return {
    hash: state.counter.hash,
    id: state.counter.id,
    count: state.counter.count
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onIncrementClick: (count) => {  
      dispatch(incrementCount(count))
    },
    onDecrementClick: (count) => {
      if(count !== 0) 
      dispatch(decrementCount(count))
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(LayoutContainer);