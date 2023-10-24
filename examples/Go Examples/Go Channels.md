## Creating Go Channels

Channels in Golang are like Unix pipes. Create channels using `make()` and the `chan` keyword by passing the data type

    my_pipe := make(chan string)

## Reading from Go Channels

To read from a Go channel use the `<` operator

    value := <-my_pipe

## Writing to Go Channels

You can write to Go Channels using the same `<` operator. 

    my_pipe <- "1000"

## Don't write on closed channels

When you write on a closed channels you will trigger an error!
