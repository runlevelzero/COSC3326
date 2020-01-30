## How to make pop up windows in swift
```js
        let alertController = UIAlertController(title: "Title Here", message: "Message Here", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "Action Title Here", style: UIAlertAction.Style.default, handler: nil))
        
        present(alertController, animated: true, completion: nil)


```

## Outlets vs Actions
### Action
Works like a function and runs the code when called
### Outlet
Essentially a variable that represents the element

## Sample Variable Definition
```js
	var varName: varType
``` 

## Optionals
We'll Get back to this soon

## How to click out of the Keyboard
When the keyboard is out, you are editing data
You need to tell the app that you are done editing
Here is the code:
```js
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        	self.view.endEditing(true)
    	}
```

