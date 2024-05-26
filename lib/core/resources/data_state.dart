//abstract class not instance able
abstract class DataState<T>
{
  final T? data;
  final String? error;
  //DataState class constractor
  const DataState(this.data,this.error);
}
//when we have data error is null
class DataSuccess<T> extends DataState<T>{
  const DataSuccess(T? data):super(data,null);
}
//when we have error we dont have data
class DataFailed<T>extends DataState<T>{
  const DataFailed(String error):super(null,error);

}