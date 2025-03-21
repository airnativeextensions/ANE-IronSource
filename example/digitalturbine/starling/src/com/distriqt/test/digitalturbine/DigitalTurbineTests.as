/**
 * @author 		Michael Archbold (https://michaelarchbold.com)
 * @created		08/01/2016
 */
package com.distriqt.test.digitalturbine
{
	import com.distriqt.extension.ironsource.IronSource;
	import com.distriqt.extension.ironsource.digitalturbine.DigitalTurbine;

	import starling.display.Sprite;

	/**
	 */
	public class DigitalTurbineTests extends Sprite
	{
		public static const TAG:String = "";

		private var _l:ILogger;

		private function log( log:String ):void
		{
			_l.log( TAG, log );
		}


		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//

		public function DigitalTurbineTests( logger:ILogger )
		{
			_l = logger;
			try
			{
				log( "DigitalTurbine Supported: " + DigitalTurbine.isSupported );
				if (DigitalTurbine.isSupported)
				{
					log( "DigitalTurbine Version:   " + DigitalTurbine.service.version );
				}

			}
			catch (e:Error)
			{
				trace( e );
			}
		}


		////////////////////////////////////////////////////////
		//  
		//

		public function test():void
		{
			IronSource.instance.validateIntegration();
		}


	}
}
