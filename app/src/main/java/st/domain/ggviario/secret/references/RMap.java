package st.domain.ggviario.secret.references;

public interface RMap {
	/**
	 * A porta de cuminicacao é gege {g = 7 | e = 5}
	 */
	int SOCKET_PORT = 7575;
	int REQUEST_NEW_CROP = 10;


	//IDENTIFICADORES
	String IDENTIFIER_SELL_PAY_CREDIT = "IDENTIFIER_SELL_PAY_CREDIT";
	String IDENTIFIER_GGVIARIO = "IDENTIFIER_GGVIARIO";
	String IDENTIFIER_MAIN_HOME = "IDENTIFIER_MAIN_HOME";

	//QUERY FROM SERVER TO CLIENTS
	String QUERY_GET_SOCKET_SERVICE = "QUERY_GET_SOCKET_SERVICE";


	//SUMARYES
	String SUMMARY_REGISTER_TREATER_LISTNER = "SUMMARY_REGISTER_TREATER_LISTNER";
	;
	String ITEM_SELL = "ITEM_SELL";
	String CAR_ACTION = "CAR_ACTION";
	String HAS_IN_CAR = "HAS_IN_CAR";
	String ITEM_SELL_QUANTITY = "ITEM_SELL_QUANTITY";
	String ITEM_SELL_MEASURE = "ITEM_SELL_MEASURE";
	int REQ_REG_CLIENT = 10;
	int RESP_REG_CLIENT = 20;
	String CLIENT = "CLIENT";

	String IDENTIFIER_CROP_DIARIO = "IDENTIFIER_CROP_DIARIO";

}
