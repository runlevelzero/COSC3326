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
## How to add a new view controller
`File > New File... > new Cocoa Touch > Subclass of: UIViewController `


## How to add a corner radius to the image

```js
    imageVar.layer.cornerRadius = imageVar.frame.size.width / 8
    imageVar.clipsToBounds = true
```
## How to RNJesus

```js
    var randomNum: Int = 0
    randomNum = Int(arc4random_uniform(<Upper Bound>))
    //will give numbers in the range of [0,<Upper Bound>)
```

## How to replace images in code

```js
    imageVar.image = UIImage("<imageName>")
```

## How to detect when the device is shook

```js
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            //Code Here
            
        }
        
    }
    
```

## How to delay the launchscreen

> Make another view controller in the storyboard and have it delay there
