export class Model {
  categories: Array<Category> = [];
}
export class Category {
  title?: string;
  projects?: Project[];
}
export class Project {
  title?: string;
  icon?: string;
  description?: string;
}
