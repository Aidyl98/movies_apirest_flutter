part of 'billboard_bloc.dart';

@immutable
abstract class BillboardEvent {
  const BillboardEvent();
}

class BillboardFetchEvent extends BillboardEvent {
  const BillboardFetchEvent();
}
