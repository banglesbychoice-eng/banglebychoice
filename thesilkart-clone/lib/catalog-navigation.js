const VALID_SORTS = new Set(['featured', 'low', 'high', 'name']);

export const DEFAULT_CATALOG_STATE = Object.freeze({
  collection: 'all',
  query: '',
  sort: 'featured',
  page: 1,
  colour: '',
  shape: '',
  size: '',
});

function firstValue(value) {
  return Array.isArray(value) ? value[0] : value;
}

function textValue(value, fallback = '') {
  const normalized = firstValue(value);
  return typeof normalized === 'string' ? normalized : fallback;
}

export function normalizeCatalogState(value = {}) {
  const page = Number.parseInt(firstValue(value.page), 10);
  const sort = textValue(value.sort, DEFAULT_CATALOG_STATE.sort);

  return {
    collection: textValue(value.collection, DEFAULT_CATALOG_STATE.collection) || DEFAULT_CATALOG_STATE.collection,
    query: textValue(value.query ?? value.q),
    sort: VALID_SORTS.has(sort) ? sort : DEFAULT_CATALOG_STATE.sort,
    page: Number.isFinite(page) && page > 0 ? page : DEFAULT_CATALOG_STATE.page,
    colour: textValue(value.colour),
    shape: textValue(value.shape),
    size: textValue(value.size),
  };
}

export function catalogStateFromSearchParams(searchParams) {
  if (searchParams instanceof URLSearchParams) {
    return normalizeCatalogState({
      collection: searchParams.get('collection'),
      q: searchParams.get('q'),
      sort: searchParams.get('sort'),
      page: searchParams.get('page'),
      colour: searchParams.get('colour'),
      shape: searchParams.get('shape'),
      size: searchParams.get('size'),
    });
  }

  return normalizeCatalogState(searchParams);
}

export function catalogStateUrl(value) {
  const state = normalizeCatalogState(value);
  const params = new URLSearchParams();

  if (state.collection !== DEFAULT_CATALOG_STATE.collection) params.set('collection', state.collection);
  if (state.query) params.set('q', state.query);
  if (state.sort !== DEFAULT_CATALOG_STATE.sort) params.set('sort', state.sort);
  if (state.page > DEFAULT_CATALOG_STATE.page) params.set('page', String(state.page));
  if (state.colour) params.set('colour', state.colour);
  if (state.shape) params.set('shape', state.shape);
  if (state.size) params.set('size', state.size);

  const query = params.toString();
  return query ? `/?${query}` : '/';
}
