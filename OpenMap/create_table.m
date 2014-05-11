//  Suhaib

typedef struct _node{
  NSString *name
  int contract_count;
  void* next;
}node;

node *contractor_array;

void* find_entry(NSSTring name, node* array){
  void* next = array;
  while(next != NULL){
    if(strcmp((node*)next->name, name)==0)
      break;
    next = array->next;
  }
  return next;
}

void add_entry(NSString name, node* array){
  while(array->next != NULL)
    array = array->next;
  node* new = (node*)malloc(sizeof(node));
  new->name = name;
  new->contract_count = 1;
  new->next = NULL;
  array->next = new;
}

fill_contractors_array(){
  for(int i=0; i<arr.count; i++){
    node* a = (node*)find_entry(arr[i].contractor_name, contractor_array)
    if(a != NULL)
      a->contract_count++;
    else
      add_entry(arr[i].contractor_name, contractor_array);
  }

}
