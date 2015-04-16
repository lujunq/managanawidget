package {
	
	// FLASH PACKAGES
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	// CICLOPE CLASSES
	import art.ciclope.managana.elements.ManaganaWidget;
	
	/**
	 * <b>Availability:</b> CICLOPE AS3 Classes - www.ciclope.art.br<br>
	 * <b>License:</b> GNU LGPL version 3<br><br>
	 * PlayerProperties creates a simple example widget to be loaded on Managana player to show current playback properties.
	 * @author Lucas Junqueira - lucas@ciclope.art.br
	 */
	public class PlayerProperties extends ManaganaWidget {
		
		// VARIABLES
		
		private var _bg:Shape;					// background shape
		private var _text:TextField;			// output text field
		private var _customCalls:uint = 0;		// number of custom function calls
		private var _lastParam:String = '';		// last custom call received parameter
		
		/**
		 * PlayerProperties constructor.
		 */
		public function PlayerProperties() {
			super();
			
			// set background
			this._bg = new Shape();
			this._bg.graphics.beginFill(0x000000, 0.75);
			this._bg.graphics.drawRect(0, 0, 410, 310);
			this._bg.graphics.endFill();
			this.addChild(this._bg);
			
			// output text
			this._text = new TextField();
			this._text.selectable = false;
			this._text.multiline = true;
			this._text.wordWrap = true;
			this._text.defaultTextFormat = new TextFormat('_sans', 12, 0xFFFFFF, true);
			this._text.width = 400;
			this._text.height = 300;
			this._text.x = 5;
			this._text.y = 5;
			this.addChild(this._text);
			this._text.text = 'Player properties widget (click to close)';
			
			// set widget
			this.startupFunction = this.onStartup;
			this.disposeFunction = this.onDispose;
			this.aspectChangeFunction = this.onInfoChange;
			this.displayFunction = this.onInfoChange;
			this.streamChangeFunction = this.onInfoChange;
			this.addCustom('noparam', this.customNoParam);
			this.addCustom('withparam', this.customWithParam, true);
			
			// interaction
			this.buttonMode = true;
			this.useHandCursor = true;
			this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		// PRIVATE METHODS
		
		/**
		 * Set the properties text.
		 */
		private function displayText():void {
			this._text.text = "Player properties widget (click to close)\n";
			// show easy-to-access information exposed by the ManaganaWidget class
			this._text.appendText("community: " + this.community + "\n");
			this._text.appendText("stream: " + this.stream + "\n");
			this._text.appendText("landscape size: " + this.landscapeSize.x + ", " + this.portraitSize + "\n");
			this._text.appendText("portrait size: " + this.portraitSize.x + ", " + this.portraitSize + "\n");
			if (this.displayAspect == ManaganaWidget.ASPECT_LANDSCAPE) {
				this._text.appendText("current aspect: landscape\n");
			} else {
				this._text.appendText("current aspect: portrait\n");
			}
			// display information about custom funcion calls from the Managana player
			this._text.appendText("custom function calls: " + this._customCalls + "\n");
			this._text.appendText("last call paramater: " + this._lastParam + "\n");
			this._text.appendText("managana: " + this.player + "\n");
			// all public methods of the ManaganaPlayer class are available to widgets
			this._text.appendText("current instances: " + this.player.getImageList().join(", ") + "\n");
		}
		
		/**
		 * Widget startup function.
		 */
		private function onStartup():void {
			this.displayText();
		}
		
		/**
		 * Custom function with no parameter.
		 */
		private function customNoParam():void {
			this._lastParam = 'none (no param function)';
			this._customCalls++;
			this.displayText();
		}
		
		/**
		 * Custom function with parameter.
		 */
		private function customWithParam(param:String):void {
			this._lastParam = param;
			this._customCalls++;
			this.displayText();
		}
		
		/**
		 * Managana player information changed.
		 */
		private function onInfoChange():void {
			this.displayText();
		}
		
		/**
		 * Widget dispose function.
		 */
		private function onDispose():void {
			this.removeChildren();
			this._bg.graphics.clear();
			this._bg = null;
			this._text = null;
			this._lastParam = null;
			this.removeEventListener(MouseEvent.CLICK, onClick);
		}
		
		/**
		 * Mouse click on widget.
		 */
		private function onClick(evt:MouseEvent):void {
			// Sending information back to the ManaganaPlayer.
			this.hideMe();
			// For complex progress code send, use the sendPCode method from ManaganaWidget class.
			// Example: the hideMe function could be exchanged for:
			// this.sendPCode('WIDGET->' + this.name + '->hide');
		}
		
	}

}