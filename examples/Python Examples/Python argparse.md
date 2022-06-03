## Commandline Handling Example

    parser = argparse.ArgumentParser(prog='myprogram')

    # Add GNU style arguments
    parser.add_argument('-m', '--mode', default='exterminate', help='run mode <seek|locate|exterminate> (default: exterminate)')

    # Add positional parameter
    parser.add_argument('param1', help='Mandatary 1st positional parameters')
    parser.add_argument('param2', nargs='?', help='Optional 2nd positional parameter')

    args = parser.parse_args()
    
    # Access input
    print(args.mode)
    print(args.param1)
    print(args.param2)      # will be None when not set

## Multi-line extra text

    parser = argparse.ArgumentParser(
      prog='myprogram',
      formatter_class=argparse.RawDescriptionHelpFormatter,
      epilog="""
    Multi-
    line-
    string
      """
    )
