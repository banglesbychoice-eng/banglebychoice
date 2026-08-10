export const DEFAULT_DELIVERY_METHOD = 'shipping';

export const DELIVERY_METHODS = {
  shipping: {
    label: 'Bangle by Choice delivery',
    description: 'We arrange delivery and calculate the charge from packed weight.',
    requiresAddress: true,
  },
  pickup: {
    label: 'Customer pickup',
    description: 'Collect the packed order after we confirm it is ready. No delivery charge.',
    requiresAddress: false,
  },
  customer_arranged: {
    label: 'Rapido or own delivery',
    description: 'You arrange and pay Rapido, Porter or another pickup service directly after readiness confirmation.',
    requiresAddress: false,
  },
};

export function getDeliveryMethod(value) {
  return DELIVERY_METHODS[value] ? value : DEFAULT_DELIVERY_METHOD;
}

export function getDeliveryDetails(value) {
  const method = getDeliveryMethod(value);
  return { method, ...DELIVERY_METHODS[method] };
}
