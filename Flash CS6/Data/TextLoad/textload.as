package
{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import flash.net.*; 
	
public function Main():void
{
	[Embed(source="Z009800D.TTF",fontName = "myFont", mimeType = "application/x-font", advancedAntiAliasing="true", embedAsCFF="false")]
	
	var myTextField:TextField = new TextField();
	var textURL:URLRequest = new URLRequest("example.txt");
	var textLoader:URLLoader = new URLLoader();	
	
	myTextField.defaultTextFormat = new TextFormat("myFont", 20);
	myTextField.embedFonts = true;
	myTextField.border = true;
	myTextField.multiline = true;
	myTextField.wordWrap = true;
	myTextField.width = 215;
	myTextField.height = 225;
	myTextField.x = 300;
	myTextField.y = 50;
	
	textLoader.addEventListener(Event.COMPLETE, onLoaded);
	
	textLoader.load(textURL);

function onLoaded(e:Event):void 
{
     myTextField.text = e.target.data;
	 addChild(myTextField);
}

function afterloaded():void
{
	trace(myTextField);
} 

  
public class TextFileLoading extends Sprite
{
		private var _output:TextField;
		
	public function TextFileLoading()
	{
			initializeOutput();
			loadData();
	}

	private function initializeOutput():void
	{
	_output = new TextField();
	_output.width = stage.stageWidth;
	_output.height = stage.stageHeight;
	_output.html = true; // Enable HTML for the text field
	addChild(_output);
	}

	private function loadData():void
	{
	var loader:URLLoader = new URLLoader();
	// Instruct the loader to read the file as plain text - This line is not
	// necessary because the dataFormat is DataFormat.TEXT by default.
	loader.dataFormat = DataFormat.TEXT;
	// Register an event handler for when the data is finished downloading
	loader.addEventListener(Event.COMPLETE, handleComplete);
	// Load the HTML text from the example.html file
	loader.load(new URLRequest("example.html"));
	}

	private function handleComplete( event:Event ):void 
	{
	var loader:URLLoader = URLLoader( event.target );
	// Assign the htmlText of the text field to the HTML text that was contained
	// in example.html. The data property of the URLLoader is the file contents.
	_output.htmlText = loader.data;
	}
  }
  
}

}




