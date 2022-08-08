enum Routes {
  notFound('notFound'),
  signIn('signIn'),
  signUp('signUp'),
  register('register'),
  home('home'),
  taskCreate('taskCreate'),
  taskDetail('taskDetail'),
  taskEdit('taskEdit'),
  setting('setting'),
  debug('debug');

  const Routes(this.value);
  final String value;
}

enum ParamKeys {
  tab('tab'),
  taskId('taskId');

  const ParamKeys(this.value);
  final String value;
}

enum QueryParamKeys {
  innerTab('innerTab');

  const QueryParamKeys(this.value);
  final String value;
}