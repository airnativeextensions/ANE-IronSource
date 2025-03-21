/**
 * @author 		Michael Archbold (https://michaelarchbold.com)
 * @created		10/06/2024
 */
package com.distriqt.test.adquality
{
	import com.distriqt.extension.ironsource.IronSource;
	import com.distriqt.extension.ironsource.adqualitysdk.AdQualitySDK;

	import starling.display.Sprite;

	/**
	 */
	public class AdQualityTests extends Sprite
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

		public function AdQualityTests( logger:ILogger )
		{
			_l = logger;
			try
			{
				log( "AdQuality Supported: " + AdQualitySDK.isSupported );
				if (AdQualitySDK.isSupported)
				{
					log( "IronSource Version:    " + IronSource.service.version );
					log( "AdQuality Version:     " + AdQualitySDK.service.version );
					log( "AdQuality SDK Version: " + AdQualitySDK.service.nativeVersion );
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

		public function init():void
		{
			IronSource.instance.init( Config.IRONSRC_APP_KEY, [
				IronSource.BANNER,
				IronSource.REWARDED_VIDEO,
				IronSource.INTERSTITIAL
			] );

			AdQualitySDK.instance.initialise( Config.IRONSRC_APP_KEY );
		}


		public function validate():void
		{
			IronSource.instance.validateIntegration();
		}


	}
}
