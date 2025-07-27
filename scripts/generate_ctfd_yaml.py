import yaml
import argparse

def generate_ctfd_yaml(title, category, value, description, flag):
    challenge = {
        'name': title,
        'category': category,
        'value': value,
        'description': description,
        'type': 'standard',
        'flags': [flag]
    }
    return yaml.dump([challenge], sort_keys=False)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--title', required=True)
    parser.add_argument('--category', required=True)
    parser.add_argument('--value', type=int, required=True)
    parser.add_argument('--description', required=True)
    parser.add_argument('--flag', required=True)
    args = parser.parse_args()

    output = generate_ctfd_yaml(
        title=args.title,
        category=args.category,
        value=args.value,
        description=args.description,
        flag=args.flag
    )

    print(output)
