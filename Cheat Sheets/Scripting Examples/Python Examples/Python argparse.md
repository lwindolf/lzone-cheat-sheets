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

## Parameter Validation

Simply pass allowed values with a list as `choices`

    parser.add_argument('-m', '--mode', help='Help!', choices=['seek','locate','exterminate'])

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

## SubParsers
    from pathlib import Path
    import sys
    
    script_name = Path(__file__).name

    def customer(args):
      #Do things with stuff
      print(f"Name: {args.name}, Alias: {args.alias}")
      return 0
      #or return 1 for failure

    parser = argparse.ArgumentParser(prog=script_name)
    subparsers = parser.add_subparsers(dest="resource")

    cust = subparsers.add_parser(
      "customer", 
      aliases=['cust'],
      help="Add customers"
    )
    cust.set_defaults(func=customer)
    cust.add_argument(
      "-a",
      "--alias",
      help="The alias assigned to the customer",
      required=True,
    )
    cust.add_argument(
      "-n", 
      "--name", 
      help="The customers name", 
      required=True
    )

    args=parser.parse_args()
    if not args.resource:
      parser.print_help()
      sys.exit(1)

    #Pass the args to the function as defined 
    #in the cust subparser (cust.set_defaults(func=customer))
    #return a exit code from the function
    sys.exit(args.func(args))

    $ ./script customer --name TheName --alias TheAlias
