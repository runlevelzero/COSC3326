## How to make pop up windows in swift
```js
        let alertController = UIAlertController(title: "Title Here", message: "Message Here", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "Action Title Here", style: UIAlertAction.Style.default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
```


