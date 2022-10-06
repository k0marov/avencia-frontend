import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

typedef BlocState<S extends Equatable> = Option<Either<Exception, S>>;
