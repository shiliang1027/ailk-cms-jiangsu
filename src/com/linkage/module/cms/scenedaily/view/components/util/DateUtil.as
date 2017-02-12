import mx.formatters.DateFormatter;

public static const dateFormatter:DateFormatter=new DateFormatter();
dateFormatter.formatString="YYYY-MM-DD JJ:NN:SS";


private var df2:DateFormatter = new DateFormatter();
public function parseDate(date:Date, patten:String):String
{
	df2.formatString = patten;
	return df2.format(date);
}

/**
 * 格式化时间
 */
public static function formatDate(date:Date):String
{
	return dateFormatter.format(date);
}
