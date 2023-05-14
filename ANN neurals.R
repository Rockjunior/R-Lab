library(keras)
model = keras_model_sequential()
model %>%
#input layer
  layer_dense(units = 256, activation = "relu",input_shape = ncol(X_train)) %>%
  layer_dropout(rate = 0.4) %>%
#Hidden layer  
  layer_dense(units = 75, activation = "relu") %>%
#Output layer
  layer_dropout(rate = 0.3) %>%
  layer_dense(units = 2, activation = "sigmoid")
model %>%compile(optimizer = 'adam', loss = 'sparse_categorical_crossentropy', metrics = c('accuracy'))
#fit the model
model %>% fit(X_train, y_train, epochs = 12, batch_size = 5, validation_split = 0.2)