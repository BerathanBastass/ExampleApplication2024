String? validator(value) {
  (value ?? '').length > 5 ? null : '5 ten küçük';
}
