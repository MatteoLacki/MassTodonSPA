# import { React, createReactClass, reactRedux, e, DOM, mobxReact } from 'app/react-tools'
# import { Link } from 'react-router-dom'
# import AddButton from 'components/FloatingAddButton'

# import drawer from 'data/ui/drawer'
# import configs from 'containers/configs'

# export default mobxReact.observer createReactClass
# 	componentWillMount: ->
# 		drawer.setText 'Configs'

# 	render: ->
# 		e React.Fragment, {},
# 			e configs, {}
# 			e Link, { to:'/configs/add' }, e AddButton
